# AICE Associate 자격증 준비 프로젝트

KT에서 개발한 AICE (AI Certificate for Everyone) Associate 자격증 취득을 위한 개념 정리 및 실습 문제 저장소입니다.

## 📁 프로젝트 구조

```
aice-associate/
├── 📚 docs/                   # 개념 정리 문서
│   └── official-example-docs/ # 공식 샘플 문항 및 해설
├── 💻 practice/               # 실습 문제
│   ├── book-examples/         # 교재 예제 코드
│   └── official-example/      # 공식 샘플 문항 실습
└── 📖 pyproject.toml          # 프로젝트 의존성 관리
```

## 🎯 학습 목표

- AICE Associate 자격증 취득
- AI/ML 관련 실무 역량 향상
- 체계적인 학습 자료 정리

## 📋 학습 계획

1. **이론 학습**: AICE 관련 핵심 개념 정리
2. **실습 연습**: 실제 문제 풀이 및 랩 실습
3. **모의고사**: 시험 대비 연습

## 🚀 시작하기

### 📋 사전 요구사항

- **Git** (2.25 이상)
- **Git LFS** (Large File Storage)
- **Python** (3.12 이상)
- **uv** (Python 패키지 관리자)

### 🔧 설치 방법

#### 1. Git LFS 설치

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install git-lfs
```

**macOS:**
```bash
brew install git-lfs
```

**Windows:**
- [Git LFS 공식 사이트](https://git-lfs.github.io/)에서 설치

#### 2. 프로젝트 클론

```bash
# 저장소 클론
git clone https://github.com/GideokKim/aice-associate.git
cd aice-associate
```

#### 3. 자동 설정 (권장)

**Linux/macOS/WSL:**
```bash
# 자동 설정 스크립트 실행
bash setup.sh
```

**Windows PowerShell:**
```powershell
# PowerShell에서 실행
powershell -ExecutionPolicy Bypass -File setup.ps1
```

#### 4. 수동 설정

자동 설정 스크립트를 사용할 수 없는 경우:

```bash
# Git LFS 초기화 (처음 한 번만)
git lfs install

# LFS 파일들 다운로드
git lfs pull

# Python 의존성 설치
uv sync
```

#### 5. 개발 환경 실행

**Jupyter Lab:**
```bash
uv run jupyter lab
```

**Jupyter Notebook:**
```bash
uv run jupyter notebook
```

**VS Code / 기타 IDE:**
```bash
# Python 인터프리터 경로 확인
uv run python -c "import sys; print(sys.executable)"

# 또는 가상환경 활성화
source .venv/bin/activate  # Linux/macOS
# .venv\Scripts\activate   # Windows
```

**Python 스크립트 직접 실행:**
```bash
uv run python your_script.py
```

### 🎛️ 고급 설정

**uv 수동 설치:**
```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows PowerShell
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### ⚠️ 중요한 참고사항

#### Git LFS 관련
- 이 프로젝트는 **대용량 데이터셋** (94.32MB CSV 파일)을 포함합니다
- **Git LFS가 필수**로 설치되어야 합니다
- `git lfs pull` 명령어로 대용량 파일들을 다운로드해야 합니다

#### 데이터셋 정보
- `practice/book-examples/supervised-learning/국민건강보험공단_건강검진정보_20211229.CSV`
- 크기: 94.32MB
- 용도: 머신러닝 실습용 데이터

### 🔍 문제 해결

#### Git LFS 오류가 발생하는 경우:
```bash
# LFS 재설치
git lfs install --force

# LFS 파일 강제 다운로드
git lfs fetch --all
git lfs checkout
```

#### 대용량 파일 다운로드가 느린 경우:
```bash
# 특정 파일만 다운로드
git lfs pull --include="*.CSV"
```

## 📄 라이선스

이 프로젝트는 **Beerware License**를 따릅니다.

만약 이 학습 자료가 AICE 자격증 취득에 도움이 되었다면, 
저자에게 맥주 한 잔을 사주시면 됩니다! 🍺

자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.

---

*이 프로젝트는 AICE Associate 자격증 준비를 위한 개인 학습 자료입니다.*
