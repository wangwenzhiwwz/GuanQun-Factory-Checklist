# 冠群工厂宣传片临时多人协作待办

## 功能
- 无需邮箱注册，首次打开自动匿名加入
- 多人打开同一链接，勾选状态实时同步
- 7 类、44 项任务，进度统计、搜索、筛选、打印
- GitHub Pages 静态托管

## 一次性配置
1. 在 https://supabase.com/ 创建项目。
2. 在 SQL Editor 执行仓库根目录的 supabase-schema.sql。
3. 在 Supabase Authentication → Sign In / Providers 中启用 Anonymous Sign-Ins（匿名登录）。
4. 在 Project Settings → API 获取 Project URL 和 anon/publishable key。
5. 将 index.html 中的 SUPABASE_URL 和 SUPABASE_ANON_KEY 两个占位值替换为上述信息并提交。严禁使用 service_role/secret key。
6. 在 GitHub 仓库 Settings → Pages → Deploy from a branch，选择 main / root 并保存。
7. 发布网址：https://wangwenzhiwwz.github.io/GuanQun-Factory-Checklist/

## 使用方式与注意事项
- 所有参与者打开同一个网址即可，无需注册或输入邮箱。
- 当前所有匿名访问者都能查看和勾选任务；不要将链接公开发布。链接转发给谁，谁就能参与修改。
- 这是临时拍摄协作清单，不包含成员身份管理和操作审计。
- 仅在前端使用 anon/publishable key，绝不放 service_role key。

## 验收
用两台设备打开同一网址；一端勾选任务，另一端应自动更新；刷新后状态仍保留。
