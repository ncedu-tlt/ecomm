package ru.ncedu.ecomm.data.accessobjects;

import ru.ncedu.ecomm.data.models.OrderItem;

import java.sql.SQLException;
import java.util.List;

public interface OrderItemsDAO {
    List<OrderItem> getOrderItems();

    OrderItem addOrderItem(OrderItem orderItem);

    OrderItem updateOrderItem(OrderItem orderItem);

    OrderItem getOrderItemByUserConfig(long productId, long salesOrderId) throws SQLException;

    void deleteOrderItem(OrderItem orderItem);

    long getProductsBySalesOrderId(long salesOrderId);

    boolean isHaveProductId(long productId);
}
