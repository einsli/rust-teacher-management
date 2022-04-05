/*
 Navicat Premium Data Transfer

 Source Server         : local-postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 140002
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140002
 File Encoding         : 65001

 Date: 05/04/2022 21:28:55
*/


-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS "public"."teacher";
CREATE TABLE "public"."teacher" (
  "id" int4 NOT NULL DEFAULT nextval('course_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "picture_url" varchar(200) COLLATE "pg_catalog"."default",
  "profile" varchar(2000) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."teacher" OWNER TO "postgres";

-- ----------------------------
-- Primary Key structure for table teacher
-- ----------------------------
ALTER TABLE "public"."teacher" ADD CONSTRAINT "teacher_pkey" PRIMARY KEY ("id");
