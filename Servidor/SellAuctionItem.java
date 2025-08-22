/*
 * (c) 2013 InfinityArts
 * All codes are for use only in HiddenProject
 */
package pie.requests.auction;

import it.gotoandplay.smartfoxserver.SmartFoxServer;
import it.gotoandplay.smartfoxserver.data.Room;
import it.gotoandplay.smartfoxserver.data.User;
import jdbchelper.JdbcException;
import jdbchelper.QueryResult;
import net.sf.json.JSONObject;

import pie.db.objects.Item;
import pie.dispatcher.IRequest;
import pie.dispatcher.RequestException;
import pie.world.Users;
import pie.world.World;

/**
 *
 * @author Rin
 */
public class SellAuctionItem implements IRequest {

    @Override
    public void process(String[] params, User user, World world, Room room) throws RequestException {
        int userId = (Integer)user.properties.get(Users.DATABASE_ID);

        int itemId;
        int charItemId;
        int quantity;
        int coins;
        int gold;
        try {
            itemId = Integer.parseInt(params[0]);
            charItemId = Integer.parseInt(params[1]);
            quantity = Integer.parseInt(params[2]);
            gold = Integer.parseInt(params[3]);
            coins = Integer.parseInt(params[4]);
        } catch (NumberFormatException var27) {
            JSONObject sell = new JSONObject();
            sell.put("cmd", "sellAuctionItem"); //sellAuctionItem
            sell.put("bitSuccess", 0);
            sell.put("CharItemID", -1);
            sell.put("strMessage", "Invalid input!");
            world.send(sell, user);
            return;
        }

        JSONObject sell = new JSONObject();
        sell.put("cmd", "sellAuctionItem"); //sellAuctionItem
        sell.put("bitSuccess", 0);
        sell.put("CharItemID", -1);
        world.db.jdbc.beginTransaction();

        try {
            QueryResult itemResult = world.db.jdbc.query("SELECT Quantity, ItemID, UserID, EnhID FROM users_items WHERE id = ?", new Object[] { charItemId});
            if (itemResult.next()) {
                int count = world.db.jdbc.queryForInt("SELECT COUNT(*) as x FROM users_markets WHERE UserID = ? AND Status = 0 AND BuyerID IS NULL AND Type = 'Auction'", user.properties.get(Users.DATABASE_ID));
                int userGold = world.db.jdbc.queryForInt("SELECT Gold FROM users WHERE id = ? FOR UPDATE", user.properties.get(Users.DATABASE_ID));
                int limit = world.db.jdbc.queryForInt("SELECT SlotsBag FROM users WHERE id = ?", user.properties.get(Users.DATABASE_ID));
                int userQty = itemResult.getInt("Quantity");
                int userDbId = itemResult.getInt("UserID");
                int itemDbId = itemResult.getInt("ItemID");
                int itemEnhId = itemResult.getInt("EnhID");
                itemResult.close();
                Item item = world.items.get(itemId);
                if (item.getMeta() != null && item.getMeta().toLowerCase().equals("nosell")) {
                    sell.put("strMessage", item.getName() + " is a non-tradable item!");
                } else if (count >= limit) {
                    sell.put("strMessage", "You have reached the maximum amount of auctions limit!");
                } else if (userDbId == userId && itemDbId == itemId) {
                    if (userGold < 1) {
                        sell.put("strMessage", "You need atleast 1 Gold to list your items on Auction House for 24 hours!");
                    } else if (coins <= 999999 && coins >= 0) {
                        if (gold <= 500000 && gold >= 0) {
                            /*
                            if (item.getEquipment().equals("ar")) {
                                quantity = userQty;
                            }
                            */

                            if (userQty >= quantity) {
                                if (userQty - quantity > 0) {
                                    world.db.jdbc.run("UPDATE users_items SET Quantity = ? WHERE id = ?", userQty - quantity, charItemId);
                                } else {
                                    world.db.jdbc.run("DELETE FROM users_items WHERE id = ?", charItemId);
                                }

                                world.db.jdbc.run("INSERT INTO users_markets_logs (OwnerID, BuyerID, Coins, Gold, ItemID, EnhID, Quantity, Market, Type) VALUES (?, NULL, ?, ?, ?, ?, ?, 'Auction', 'Sell')", (Integer)user.properties.get(Users.DATABASE_ID), coins, gold, itemId, itemEnhId, quantity);
                                world.db.jdbc.run("INSERT INTO users_markets (`id`, `UserID`, `ItemID`, `Datetime`, `BuyerID`, `Coins`, `Gold`, `Quantity`, `EnhID`, `Type`, `Status`) VALUES (NULL, ?, ?, DATE_ADD(NOW(), INTERVAL (24) HOUR), NULL, ?, ?, ?, ?, 'Auction', 0)", userId, itemId, coins, gold, quantity, itemEnhId);
                                sell.put("bitSuccess", 1);
                                sell.put("CharItemID", charItemId);
                                sell.put("Quantity", quantity);
                                world.db.jdbc.run("UPDATE users SET Gold = Gold - 1 WHERE id = ?", userId);
                                JSONObject tr = new JSONObject();
                                tr.put("cmd", "updateGoldCoins"); //updateGoldCoins
                                tr.put("coins", world.db.jdbc.queryForInt("SELECT Coins FROM users WHERE id = ?", userId));
                                world.send(tr, user);

                            } else {
                                sell.put("strMessage", "Quantity requirement for turning in item is lacking.");
                            }
                        } else {
                            sell.put("strMessage", "Coins price cannot be more than 500,000 or less than 0!");
                        }
                    } else {
                        sell.put("strMessage", "Gold price cannot be more than 999,999 or less than 0!");
                    }
                } else {
                    world.users.log(user, "Packet Edit [SellItem]", "Attempted to sell an item not in possession");
                }
            }

            itemResult.close();
        } catch (JdbcException var28) {
            if (world.db.jdbc.isInTransaction()) {
                world.db.jdbc.rollbackTransaction();
            }

            SmartFoxServer.log.severe("Error in sell item transaction: " + var28.getMessage());
        } finally {
            if (world.db.jdbc.isInTransaction()) {
                world.db.jdbc.commitTransaction();
            }

        }

        world.send(sell, user);
        //SmartFoxServer.log.fine(sell.toString());
    }
}
