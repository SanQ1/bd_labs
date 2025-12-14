-- CreateTable
CREATE TABLE "ratings" (
    "rating" DOUBLE PRECISION NOT NULL,
    "customerid" INTEGER NOT NULL,
    "productid" INTEGER NOT NULL,

    CONSTRAINT "ratings_pkey" PRIMARY KEY ("productid","customerid")
);

-- AddForeignKey
ALTER TABLE "ratings" ADD CONSTRAINT "ratings_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "customers"("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ratings" ADD CONSTRAINT "ratings_productid_fkey" FOREIGN KEY ("productid") REFERENCES "products"("productid") ON DELETE NO ACTION ON UPDATE NO ACTION;
