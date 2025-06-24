#!/bin/bash

# AICE Associate 프로젝트 설정 스크립트
# 사용법: bash setup.sh

set -e

echo "🚀 AICE Associate 프로젝트 설정을 시작합니다..."

# Git LFS 확인
echo "📦 Git LFS 확인 중..."
if ! command -v git-lfs &> /dev/null; then
    echo "❌ Git LFS가 설치되어 있지 않습니다."
    echo "🔧 Git LFS를 설치해주세요:"
    echo "   Ubuntu/Debian: sudo apt install git-lfs"
    echo "   macOS: brew install git-lfs"
    echo "   Windows: https://git-lfs.github.io/"
    exit 1
fi

# Git LFS 초기화
echo "🔧 Git LFS 초기화..."
git lfs install

# LFS 파일 다운로드
echo "📥 대용량 파일 다운로드 중... (시간이 걸릴 수 있습니다)"
git lfs pull

# UV 확인
echo "🐍 UV 패키지 매니저 확인 중..."
if ! command -v uv &> /dev/null; then
    echo "⚠️  UV가 설치되어 있지 않습니다."
    echo "🔧 UV를 설치하시겠습니까? (y/n)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        curl -LsSf https://astral.sh/uv/install.sh | sh
        export PATH="$HOME/.cargo/bin:$PATH"
    else
        echo "❌ UV 설치를 건너뜁니다. 수동으로 설치해주세요."
        exit 1
    fi
fi

# Python 환경 설정
echo "🔧 Python 가상환경 및 의존성 설치..."
uv sync

echo "✅ 설정 완료!"
echo ""
echo "🎯 개발 환경 실행 방법:"
echo "   Jupyter Lab:      uv run jupyter lab"
echo "   Jupyter Notebook: uv run jupyter notebook"
echo "   Python 스크립트:   uv run python your_script.py"
echo "   가상환경 활성화:    source .venv/bin/activate"
echo ""
echo "📁 주요 파일들:"
echo "   📚 docs/official-example-docs/ - 공식 샘플 문항 및 해설"
echo "   💻 practice/book-examples/ - 교재 예제 코드"
echo "   💻 practice/official-example/ - 공식 샘플 문항 실습"
echo ""
echo "🍺 즐거운 학습 되세요!" 