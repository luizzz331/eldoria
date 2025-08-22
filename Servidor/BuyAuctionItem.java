package pie.requests.auction;

import it.gotoandplay.smartfoxserver.SmartFoxServer;
import it.gotoandplay.smartfoxserver.data.Room;
import it.gotoandplay.smartfoxserver.data.User;
import java.util.Map;
import jdbchelper.JdbcException;
import jdbchelper.QueryResult;
import net.sf.json.JSONObject;
import pie.db.objects.Enhancement;
import pie.db.objects.Item;
import pie.dispatcher.IRequest;
import pie.dispatcher.RequestException;
import pie.world.Users;
import pie.world.World;

public class BuyAuctionItem implements IRequest {

    @Override
    public void process(String[] params, User user, World world, Room room) throws RequestException {
        JSONObject buy = new JSONObject();
        buy.put("cmd", "buyAuctionItem");
        buy.put("bitSuccess", 0);
        buy.put("CharItemID", -1);
        int auctionId = Integer.parseInt(params[0]);
        world.db.jdbc.beginTransaction();

        try {
            QueryResult auctionResult = world.db.jdbc.query("SELECT users_markets.*, users.Name AS OWNER, CONCAT(HOUR(TIMEDIFF(NOW(), DATETIME)), ':', MINUTE(TIMEDIFF(NOW(), DATETIME)), ':', SECOND(TIMEDIFF(NOW(), DATETIME))) AS TIMEDIFF FROM users_markets JOIN users ON users.id = users_markets.UserID WHERE users_markets.id = ? AND users_markets.Type = 'Auction' FOR UPDATE", auctionId);
            
            if (auctionResult.next()) {
                int SellerID = auctionResult.getInt("UserID");
                Item item = world.items.get(auctionResult.getInt("ItemID"));
                Enhancement enhancement = world.enhancements.get(auctionResult.getInt("EnhID"));
                
                // --- CORREÇÃO FINAL: Usando user.getUserId() ---
                int realUserId = user.getUserId();
                int userLevel = (Integer)user.properties.get(Users.LEVEL);
                Object userCharacterId = world.db.jdbc.queryForInt(
                    "SELECT id FROM users_characters WHERE UserID = ? AND Level = ? LIMIT 1", 
                    realUserId, userLevel
                );

                if (item.getFactionId() > 1) {
                    Map<Integer, Integer> factions = (Map)user.properties.get(Users.FACTIONS);
                    if (!factions.containsKey(item.getFactionId()) || factions.get(item.getFactionId()) < item.getReqReputation()) {
                        world.db.jdbc.rollbackTransaction();
                        buy.put("strMessage", "Requisito de reputação não atendido! (" + item.getFactionId() + "/" + item.getReqReputation() + ")");
                        world.send(buy, user);
                        auctionResult.close();
                        return;
                    }
                }

                int inventoryCount = world.db.jdbc.queryForInt("SELECT COUNT(*) AS rowcount FROM users_characters_inventory LEFT JOIN items ON items.id = users_characters_inventory.ItemID WHERE Equipment NOT IN ('ho','hi') AND CharacterID = ? AND ItemID NOT IN (?)", userCharacterId, item.getId());
                int sellerAccess = world.db.jdbc.queryForInt("SELECT Access FROM users WHERE id = ?", SellerID);
                
                if (item.isUpgrade() && (Integer)user.properties.get(Users.UPGRADE_DAYS) < 0) {
                    buy.put("strMessage", "Este item é apenas para membros!");
                } else if (item.getLevel() > userLevel) {
                    buy.put("strMessage", "Você não tem o nível necessário para comprar este item!");
                } else if (item.isStaff() && !user.isAdmin() && !user.isModerator() || sellerAccess >= 40 && !user.isAdmin() && !user.isModerator()) {
                    buy.put("strMessage", "Item de teste: Ainda não pode ser comprado!");
                } else if ((user.isAdmin() || user.isModerator()) && sellerAccess < 40) {
                    buy.put("strMessage", "Restrição da equipe: você não pode comprar itens de jogadores!");
                } else if (inventoryCount >= (Integer)user.properties.get(Users.SLOTS_BAG)) {
                    buy.put("strMessage", "Seu inventário está cheio!");
                } else if (SellerID == realUserId) {
                    buy.put("strMessage", "Você não pode comprar seu próprio item! Para reavê-lo, use a aba 'Recuperar'.");
                } else if (auctionResult.getInt("BuyerID") <= 0 && auctionResult.getInt("Status") != 1 && Integer.parseInt(auctionResult.getString("TIMEDIFF").split(":")[0]) < 24) {
                    
                    QueryResult userResult = world.db.jdbc.query("SELECT Gold, Coins FROM users_characters WHERE id = ? FOR UPDATE", userCharacterId);
                    
                    if (userResult.next()) {
                        int coins = userResult.getInt("Coins");
                        int gold = userResult.getInt("Gold");
                        userResult.close();

                        if (gold >= auctionResult.getInt("Gold") && coins >= auctionResult.getInt("Coins")) {
                            QueryResult itemResult = world.db.jdbc.query("SELECT id FROM users_characters_inventory WHERE ItemID = ? AND CharacterID = ? AND Quantity > 0", item.getId(), userCharacterId);
                            int charItemId;

                            if (itemResult.next()) {
                                charItemId = itemResult.getInt("id");
                                itemResult.close();
                                if (item.getStack() > 1) {
                                    int quantity = world.db.jdbc.queryForInt("SELECT Quantity FROM users_characters_inventory WHERE id = ? FOR UPDATE", charItemId);
                                    if (quantity + auctionResult.getInt("Quantity") > item.getStack()) {
                                        world.db.jdbc.rollbackTransaction();
                                        buy.put("strMessage", "Você não pode ter mais de " + item.getStack() + " unidades desse item!");
                                        world.send(buy, user);
                                        auctionResult.close();
                                        return;
                                    }
                                    
                                    world.db.jdbc.run("INSERT INTO users_markets_logs (OwnerID, BuyerID, Coins, Gold, ItemID, EnhID, Quantity, Market, Type) VALUES (?, ?, ?, ?, ?, ?, ?, 'Auction', 'Buy')", SellerID, realUserId, auctionResult.getInt("Coins") , auctionResult.getInt("Gold") , item.getId(),  auctionResult.getInt("EnhID"), auctionResult.getInt("Quantity"));
                                    world.db.jdbc.run("UPDATE users_characters_inventory SET Quantity = (Quantity + ?) WHERE id = ?", auctionResult.getInt("Quantity"), charItemId);
                                } else {
                                    world.db.jdbc.rollbackTransaction();
                                    buy.put("strMessage", "Você não pode ter mais de " + item.getStack() + " unidades desse item!");
                                    world.send(buy, user);
                                    auctionResult.close();
                                    return;
                                }
                            } else {
                                itemResult.close();
                                world.db.jdbc.run("INSERT INTO users_markets_logs (OwnerID, BuyerID, Coins, Gold, ItemID, EnhID, Quantity, Market, Type) VALUES (?, ?, ?, ?, ?, ?, ?, 'Auction', 'Buy')", SellerID, realUserId, auctionResult.getInt("Coins") , auctionResult.getInt("Gold") , item.getId(),  auctionResult.getInt("EnhID"), auctionResult.getInt("Quantity"));
                                world.db.jdbc.run("INSERT INTO users_characters_inventory (CharacterID, ItemID, EnhID, Equipped, Quantity) VALUES (?, ?, ?, '0', ?)", userCharacterId, item.getId(), auctionResult.getInt("EnhID"), auctionResult.getInt("Quantity"));
                                charItemId = Long.valueOf(world.db.jdbc.getLastInsertId()).intValue();
                            }

                            if (charItemId > 0) {
                                world.db.jdbc.run("UPDATE users_characters SET Gold = (Gold - ?), Coins = (Coins - ?) WHERE id = ?", auctionResult.getInt("Gold"), auctionResult.getInt("Coins"), userCharacterId);
                                world.db.jdbc.run("UPDATE users_markets SET BuyerID = ?, Status = 0 WHERE id = ? AND Type = 'Auction'", realUserId, auctionId);
                                
                                JSONObject itemObj = Item.getItemJSON(item, enhancement);
                                itemObj.put("CharItemID", charItemId);
                                itemObj.put("AuctionID", auctionResult.getInt("id"));
                                itemObj.put("iQty", auctionResult.getInt("Quantity"));
                                buy.put("bitSuccess", 1);
                                buy.put("CharItemID", charItemId);
                                buy.put("item", itemObj);
                                
                                JSONObject tr = new JSONObject();
                                tr.put("cmd", "updateGoldCoins");
                                tr.put("gold", gold - auctionResult.getInt("Gold"));
                                tr.put("coins", coins - auctionResult.getInt("Coins"));
                                world.send(tr, user);

                            } else {
                                world.db.jdbc.rollbackTransaction();
                                buy.put("strMessage", "Ocorreu um erro ao comprar o item!");
                            }
                        } else {
                            buy.put("strMessage", "Dinheiro insuficiente!");
                        }
                    } else {
                        buy.put("strMessage", "ERRO: Não foi possível encontrar os dados do seu personagem!");
                    }
                } else {
                    buy.put("strMessage", "O item " + item.getName() + " não está mais disponível.");
                }
            } else {
                buy.put("strMessage", "O leilão não foi encontrado.");
            }
            auctionResult.close();
        } catch (JdbcException var22) {
            if (world.db.jdbc.isInTransaction()) {
                world.db.jdbc.rollbackTransaction();
            }
            SmartFoxServer.log.severe("Erro na transação de compra de item do leilão: " + var22.getMessage());
            var22.printStackTrace();
        } finally {
            if (world.db.jdbc.isInTransaction()) {
                world.db.jdbc.commitTransaction();
            }
        }

        world.send(buy, user);
    }
}
