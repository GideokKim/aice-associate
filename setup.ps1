# AICE Associate 프로젝트 설정 스크립트 (Windows PowerShell)
# 사용법: powershell -ExecutionPolicy Bypass -File setup.ps1

Write-Host "🚀 AICE Associate 프로젝트 설정을 시작합니다..." -ForegroundColor Green

# Git LFS 확인
Write-Host "📦 Git LFS 확인 중..." -ForegroundColor Yellow
try {
    git lfs version | Out-Null
    Write-Host "✅ Git LFS가 설치되어 있습니다." -ForegroundColor Green
} catch {
    Write-Host "❌ Git LFS가 설치되어 있지 않습니다." -ForegroundColor Red
    Write-Host "🔧 Git LFS를 설치해주세요:" -ForegroundColor Yellow
    Write-Host "   1. https://git-lfs.github.io/ 에서 설치" -ForegroundColor White
    Write-Host "   2. 또는 winget install -e --id GitHub.GitLFS" -ForegroundColor White
    exit 1
}

# Git LFS 초기화
Write-Host "🔧 Git LFS 초기화..." -ForegroundColor Yellow
git lfs install

# LFS 파일 다운로드
Write-Host "📥 대용량 파일 다운로드 중... (시간이 걸릴 수 있습니다)" -ForegroundColor Yellow
git lfs pull

# UV 확인
Write-Host "🐍 UV 패키지 매니저 확인 중..." -ForegroundColor Yellow
try {
    uv --version | Out-Null
    Write-Host "✅ UV가 설치되어 있습니다." -ForegroundColor Green
} catch {
    Write-Host "⚠️  UV가 설치되어 있지 않습니다." -ForegroundColor Yellow
    $response = Read-Host "🔧 UV를 설치하시겠습니까? (y/n)"
    if ($response -match "^[Yy]") {
        Write-Host "UV 설치 중..." -ForegroundColor Yellow
        Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
        # PATH 새로고침
        $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
    } else {
        Write-Host "❌ UV 설치를 건너뜁니다. 수동으로 설치해주세요." -ForegroundColor Red
        exit 1
    }
}

# Python 환경 설정
Write-Host "🔧 Python 가상환경 및 의존성 설치..." -ForegroundColor Yellow
uv sync

Write-Host "✅ 설정 완료!" -ForegroundColor Green
Write-Host ""
Write-Host "🎯 개발 환경 실행 방법:" -ForegroundColor Cyan
Write-Host "   Jupyter Lab:      uv run jupyter lab" -ForegroundColor White
Write-Host "   Jupyter Notebook: uv run jupyter notebook" -ForegroundColor White
Write-Host "   Python 스크립트:   uv run python your_script.py" -ForegroundColor White
Write-Host "   가상환경 활성화:    .venv\Scripts\activate" -ForegroundColor White
Write-Host ""
Write-Host "📁 주요 파일들:" -ForegroundColor Cyan
Write-Host "   📚 docs/official-example-docs/ - 공식 샘플 문항 및 해설" -ForegroundColor White
Write-Host "   💻 practice/book-examples/ - 교재 예제 코드" -ForegroundColor White
Write-Host "   💻 practice/official-example/ - 공식 샘플 문항 실습" -ForegroundColor White
Write-Host ""
Write-Host "🍺 즐거운 학습 되세요!" -ForegroundColor Green 