const readline = require('readline');
const fs = require('fs');

const OrderQueue = require('./queue');
const BotManager = require('./botManager');
const OrderController = require('./orderController');

fs.writeFileSync("scripts/result.txt", ""); // reset file

const queue = new OrderQueue();
const botManager = new BotManager(queue);
const controller = new OrderController(queue, botManager);

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

console.log("Commands: new-normal, new-vip, add-bot, remove-bot, status, exit");

rl.on('line', (input) => {
    switch (input.trim()) {
    case 'new-normal':
      controller.newNormalOrder();
      break;

    case 'new-vip':
      controller.newVIPOrder();
      break;

    case 'add-bot':
      botManager.addBot();
      break;

    case 'remove-bot':
      botManager.removeBot();
      break;

    case 'status':
      controller.status();
      break;

    case 'exit':
      rl.close();
      process.exit(0);

    default:
      console.log("Unknown command");
  }
});