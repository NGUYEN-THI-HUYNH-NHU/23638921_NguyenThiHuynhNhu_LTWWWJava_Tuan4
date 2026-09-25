/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/25/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai3.beans;

import java.util.ArrayList;
import java.util.List;

public class CartBean {
    private List<CartItemBean> items;

    public CartBean() {
        this.items = new ArrayList<>();
    }

    public List<CartItemBean> getItems() {
        return this.items;
    }

    public void addProduct(Product p) {
        for (CartItemBean item : items) {
            if (item.getProduct().getId() == p.getId()) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        items.add(new CartItemBean(p, 1));
    }

    public void removeProduct(int productId) {
        items.removeIf(i -> i.getProduct().getId() == productId);
    }

    public void updateQuantity(int productId, int quantity) {
        for (CartItemBean item : items) {
            if (item.getProduct().getId() == productId) {
                if (quantity > 0)
                    item.setQuantity(quantity);
                else
                    removeProduct(productId);
                return;
            }
        }
    }

    public double getTotal() {
        double total = 0;
        for (CartItemBean item : items) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        return total;
    }

    public void clear() {
        items.clear();
    }
}
