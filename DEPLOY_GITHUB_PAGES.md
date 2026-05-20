# GitHub Pages Deployment Guide

## 🚀 Triển khai tự động lên GitHub Pages

Đã cấu hình để tự động deploy khi push lên `main` branch.

## 📋 Các Bước

### 1. Chạy Script Deploy
Double-click file `deploy-github-pages.bat` (hoặc chạy thủ công):

```bash
cd d:\TYBACH\my-app
git init
git add .
git commit -m "Deploy to GitHub Pages"
git remote add origin https://github.com/dinhquochung9999/TB_WEBAPP.git
git branch -M main
git push -u origin main --force
```

### 2. Bật GitHub Pages trong Repository
1. Truy cập: https://github.com/dinhquochung9999/TB_WEBAPP/settings/pages
2. Trong phần **Build and deployment**:
   - Source: **GitHub Actions** (nếu có)
   - Hoặc chọn Branch: **gh-pages**, Folder: **/ (root)**
3. Nhấn **Save**

### 3. Xác nhận Deployment
- GitHub Actions sẽ tự động chạy khi push
- Xem trạng thái: https://github.com/dinhquochung9999/TB_WEBAPP/actions
- Web sẽ accessible tại: **https://dinhquochung9999.github.io/TB_WEBAPP/**

## ⚙️ Cấu hình tự động

- **vite.config.ts**: Thêm `base: '/TB_WEBAPP/'` để đúng path
- **.github/workflows/deploy.yml**: Workflow tự động build + deploy
- **deploy-github-pages.bat**: Script push lần đầu

## ✅ Kiểm tra

Sau ~1-2 phút, truy cập:
```
https://dinhquochung9999.github.io/TB_WEBAPP/
```

Nếu lỗi, kiểm tra:
- Repository settings > Pages
- Actions tab để xem build logs
- Đảm bảo `main` branch được push
