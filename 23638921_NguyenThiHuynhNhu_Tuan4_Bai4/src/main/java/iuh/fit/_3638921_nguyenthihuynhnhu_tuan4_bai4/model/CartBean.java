/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/26/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.model;

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

    public int getItemCount() {
        int count = 0;
        for (CartItemBean item : items) {
            count += item.getQuantity();
        }
        return count;
    }

    public void addBook(Book book) {
        for (CartItemBean item : items) {
            if (item.getBook().getId() == book.getId()) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        items.add(new CartItemBean(book, 1));
    }

    public void removeBook(int bookId) {
        items.removeIf(i -> i.getBook().getId() == bookId);
    }

    public double getTotal() {
        double total = 0;
        for (CartItemBean item : items) {
            total += item.getSubtotal();
        }

        return total;
    }
}
