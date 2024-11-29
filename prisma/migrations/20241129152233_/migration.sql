-- CreateTable
CREATE TABLE "Products" (
    "id" BIGINT NOT NULL,
    "Price" DECIMAL(65,30) NOT NULL,
    "Name" TEXT NOT NULL,
    "vegetarian" BOOLEAN NOT NULL,
    "vegan" BOOLEAN NOT NULL,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Orders" (
    "id" BIGINT NOT NULL,
    "table" BIGINT NOT NULL,
    "paidfor" BOOLEAN NOT NULL,

    CONSTRAINT "Orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tables" (
    "id" BIGINT NOT NULL,

    CONSTRAINT "Tables_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderProduct" (
    "id" BIGINT NOT NULL,
    "table" BIGINT NOT NULL,
    "product" BIGINT NOT NULL,
    "notes" TEXT,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fulfilled" BOOLEAN NOT NULL,

    CONSTRAINT "OrderProduct_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_table_fkey" FOREIGN KEY ("table") REFERENCES "Tables"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_table_fkey" FOREIGN KEY ("table") REFERENCES "Tables"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_product_fkey" FOREIGN KEY ("product") REFERENCES "Products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
