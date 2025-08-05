# Next.js 캐시 관련 문제 해결을 위한 스크립트
$ErrorActionPreference = "SilentlyContinue"

Write-Host "=== Next.js 캐시 정리 시작 ===" -ForegroundColor Green

# 1. 모든 Node.js 프로세스 종료
Write-Host "1. Node.js 프로세스 종료 중..." -ForegroundColor Yellow
Get-Process -Name node | Stop-Process -Force

# 2. Next.js 관련 캐시 디렉토리 삭제
Write-Host "2. Next.js 캐시 삭제 중..." -ForegroundColor Yellow
Remove-Item -Path ".next" -Recurse -Force
Remove-Item -Path "node_modules/.cache" -Recurse -Force
Remove-Item -Path ".turbo" -Recurse -Force

# 3. TypeScript 빌드 정보 삭제
Write-Host "3. TypeScript 캐시 삭제 중..." -ForegroundColor Yellow
Remove-Item -Path "*.tsbuildinfo" -Force
Remove-Item -Path "next-env.d.ts" -Force

Write-Host "=== 캐시 정리 완료 ===" -ForegroundColor Green
Write-Host "이제 'npm run dev'로 개발 서버를 시작하세요." -ForegroundColor Cyan
