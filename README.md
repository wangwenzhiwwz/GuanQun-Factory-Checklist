# 冠群工厂宣传片多人协作待办

## 功能
- 团队成员邮箱登录（Supabase Auth）
- 多人共同勾选同一份清单，Realtime 自动同步
- 7 类、44 项任务，进度统计、搜索、筛选、打印
- GitHub Pages 静态托管

## 部署步骤
1. 在 https://supabase.com/ 创建项目。
2. 在 SQL Editor 执行仓库根目录的 supabase-schema.sql。
3. 在 Supabase Authentication 设置中关闭公开注册，并在 Users 中邀请团队成员邮箱。
4. 在 Project Settings → API 获取 Project URL 和 anon/publishable key。严禁使用 service_role/secret key。
5. 编辑 index.html 顶部脚本中的 SUPABASE_URL 和 SUPABASE_ANON_KEY 两个常量，提交修改。
6. 在 Authentication → URL Configuration 中，将 GitHub Pages 地址加入 Site URL 和 Redirect URLs。
7. GitHub 仓库 Settings → Pages → Deploy from a branch，选择 main / root 并保存。
8. 发布网址：https://wangwenzhiwwz.github.io/GuanQun-Factory-Checklist/

## 安全说明
当前 SQL 策略允许所有已认证用户读取及更新清单。务必关闭公开注册，只邀请团队成员邮箱。需要按角色区分只读/编辑或审计操作时，应增加成员角色表和更细粒度 RLS 策略。前端仅放 anon/publishable key，绝不放 service_role key。

## 验收
使用两个已邀请邮箱分别在手机和电脑登录；一端勾选任务，另一端应自动更新；刷新后状态仍保留。
