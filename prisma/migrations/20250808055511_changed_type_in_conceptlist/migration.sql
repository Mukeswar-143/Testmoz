/*
  Warnings:

  - The `conceptsCovered` column on the `Test` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Test" DROP COLUMN "conceptsCovered",
ADD COLUMN     "conceptsCovered" TEXT[];
