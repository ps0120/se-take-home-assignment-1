class OrderController {
  constructor(queue, botManager) {
    this.queue = queue;
    this.botManager = botManager;
    this.orderId = 1;
  }

  newNormalOrder() {
    const order = { id: this.orderId++, type: 'NORMAL' };
    this.queue.addOrder(order);
    console.log(`Normal Order ${order.id} added`);
    this.botManager.triggerAll();
  }

  newVIPOrder() {
    const order = { id: this.orderId++, type: 'VIP' };
    this.queue.addOrder(order);
    console.log(`VIP Order ${order.id} added`);
    this.botManager.triggerAll();
  }

  status() {
    this.queue.printQueue();
  }
}

module.exports = OrderController;