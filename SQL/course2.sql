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

 Date: 05/04/2022 21:29:30
*/


-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS "public"."course";
CREATE TABLE "public"."course" (
  "id" int4 NOT NULL DEFAULT nextval('course_id_seq'::regclass),
  "teacher_id" int4 NOT NULL,
  "name" varchar(140) COLLATE "pg_catalog"."default" NOT NULL,
  "time" timestamp(6) DEFAULT now(),
  "description" varchar(2000) COLLATE "pg_catalog"."default",
  "format" varchar(30) COLLATE "pg_catalog"."default",
  "structure" varchar(200) COLLATE "pg_catalog"."default",
  "duration" varchar(30) COLLATE "pg_catalog"."default",
  "price" int4,
  "language" varchar(30) COLLATE "pg_catalog"."default",
  "level" varchar(30) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."course" OWNER TO "postgres";

-- ----------------------------
-- Primary Key structure for table course
-- ----------------------------
ALTER TABLE "public"."course" ADD CONSTRAINT "course_pkey" PRIMARY KEY ("id");
