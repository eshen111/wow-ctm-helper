-- CTM 私服助手 - 数据库建表 SQL
-- 在 Supabase SQL Editor 中运行此脚本

CREATE TABLE IF NOT EXISTS app_data (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  data JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 开启实时订阅（需在 Supabase 后台手动开启）
-- 路径: Database → Replication → 启用 app_data 表的 INSERT/UPDATE/DELETE
