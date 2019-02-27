#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

static int __init pancreas_init(void)
{
    printk(KERN_ALERT "Hi! Pancreas is loaded!\n");
    return 0;
}

static void __exit pancreas_exit(void)
{
    printk(KERN_ALERT "Bye! Pancreas is gone!\n");
}

module_init(pancreas_init);
module_exit(pancreas_exit);
MODULE_LICENSE("MIT");
MODULE_DESCRIPTION("Exemplo simples");