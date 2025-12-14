-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateEnum
CREATE TYPE "ways_of_payment" AS ENUM ('cash', 'card');

-- CreateTable
CREATE TABLE "categories" (
    "categoryid" SERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("categoryid")
);

-- CreateTable
CREATE TABLE "customers" (
    "customerid" SERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "surname" VARCHAR(32) NOT NULL,
    "email" VARCHAR(32) NOT NULL,
    "phone_number" VARCHAR(32),

    CONSTRAINT "customers_pkey" PRIMARY KEY ("customerid")
);

-- CreateTable
CREATE TABLE "order_items" (
    "productid" INTEGER NOT NULL,
    "orderid" INTEGER NOT NULL,
    "cost" DECIMAL(10,2) NOT NULL,
    "quantity" INTEGER NOT NULL,

    CONSTRAINT "order_items_pkey" PRIMARY KEY ("productid","orderid")
);

-- CreateTable
CREATE TABLE "orders" (
    "orderid" SERIAL NOT NULL,
    "cost" DECIMAL(10,2) NOT NULL,
    "address" VARCHAR(256) NOT NULL,
    "customerid" INTEGER NOT NULL,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderid")
);

-- CreateTable
CREATE TABLE "payments" (
    "paymentid" SERIAL NOT NULL,
    "sum" DECIMAL(10,2) NOT NULL,
    "way_of_payment" "ways_of_payment",
    "orderid" INTEGER NOT NULL,

    CONSTRAINT "payments_pkey" PRIMARY KEY ("paymentid")
);

-- CreateTable
CREATE TABLE "product_categories" (
    "productid" INTEGER NOT NULL,
    "categoryid" INTEGER NOT NULL,

    CONSTRAINT "product_categories_pkey" PRIMARY KEY ("productid","categoryid")
);

-- CreateTable
CREATE TABLE "products" (
    "productid" SERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "description" TEXT,
    "quantity" INTEGER NOT NULL,
    "cost_for_one" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
);

-- CreateIndex
CREATE UNIQUE INDEX "payments_orderid_key" ON "payments"("orderid");

-- AddForeignKey
ALTER TABLE "order_items" ADD CONSTRAINT "order_items_orderid_fkey" FOREIGN KEY ("orderid") REFERENCES "orders"("orderid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order_items" ADD CONSTRAINT "order_items_productid_fkey" FOREIGN KEY ("productid") REFERENCES "products"("productid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "customers"("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "payments" ADD CONSTRAINT "payments_orderid_fkey" FOREIGN KEY ("orderid") REFERENCES "orders"("orderid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "product_categories" ADD CONSTRAINT "product_categories_categoryid_fkey" FOREIGN KEY ("categoryid") REFERENCES "categories"("categoryid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "product_categories" ADD CONSTRAINT "product_categories_productid_fkey" FOREIGN KEY ("productid") REFERENCES "products"("productid") ON DELETE NO ACTION ON UPDATE NO ACTION;

