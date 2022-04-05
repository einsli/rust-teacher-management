use actix_web::{web, App, HttpServer};
use std::io;
use std::sync::Mutex;
use dotenv::dotenv;
use std::env;
use sqlx::postgres::PgPoolOptions;


// 添加模块声明
#[path = "../dbaccess/mod.rs"]
mod db_access;
#[path = "../error.rs"]
mod errors;
#[path = "../handlers/mod.rs"]
mod handlers;
#[path = "../models/mod.rs"]
mod models;
#[path = "../routers.rs"]
mod routers;
#[path = "../state.rs"]
mod state;

use routers::*;
use state::AppState;
use crate::errors::MyError;

#[actix_web::main]
async fn main() -> io::Result<()> {
    dotenv().ok();

    let database_url = env::var("DATABASE_URL").expect(
        "DATABASE_URL is not set.");
    // 创建连接池
    let db_pool = PgPoolOptions::new().connect(&database_url)
        .await
        .unwrap();

    // 初始化AppState
    let shared_data = web::Data::new(AppState {
        health_check_response: "I'm OK.".to_string(),
        visit_count: Mutex::new(0),
        // courses: Mutex::new(vec![]),
        db: db_pool,
    });

    let app = move || {
        App::new()
            .app_data(shared_data.clone())
            .app_data(web::JsonConfig::default().error_handler(|_err, _req| {
            MyError::InvalidInput("Player provide valid Json input".to_string()).into()
            }))
            .configure(gengral_routes)
            .configure(course_routes)
            .configure(teacher_routes)
    };
    HttpServer::new(app).bind("127.0.0.1:3000")?.run().await
}