/*
  Warnings:

  - Made the column `password` on table `Mentor` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Mentor" ALTER COLUMN "password" SET NOT NULL;
