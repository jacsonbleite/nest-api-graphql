/*
  Warnings:

  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `user` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- CreateTable
CREATE TABLE "post_user" (
    "post_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    PRIMARY KEY ("post_id", "user_id"),
    FOREIGN KEY ("post_id") REFERENCES "post" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_user" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "profile_picture" TEXT,
    "name" TEXT,
    "password" TEXT
);
INSERT INTO "new_user" ("email", "id", "name", "password", "profile_picture") SELECT "email", "id", "name", "password", "profile_picture" FROM "user";
DROP TABLE "user";
ALTER TABLE "new_user" RENAME TO "user";
CREATE UNIQUE INDEX "user.email_unique" ON "user"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
