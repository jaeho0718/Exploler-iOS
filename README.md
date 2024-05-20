# iOS 개발노트

## 🗂️ 파일 구조
```bash
├── Component
│   └── Color
│   └── Font
│   └── Style
│   └── Layout
├── Feature
│   ├── Feature1
│   └── Feature2
├── Logic
│   └── ViewModel1
└── Core
    ├── Model
    ├── Logger
    └── Network
```

## 브랜치 및 커밋 규칙
**브랜치**는 다음과 같은 구조로 나눕니다.
```bash
├── main
├── release
├── develop
│   ├── fetaure/feature1
│   └── fetaure/feature2
└── hotfix
    ├── hotfix/hotfix1
    └── hotfix/hotfix2
```

**커밋**은 다음 형식으로합니다.
```bash
[Type] Title

Body
```
#### Title 작성 규칙
1. 제목은 50자 미만, 첫 글자 대문자 시작
2. 과거형이 아닌 명령형으로 작성(ex, Fixed -> Fix)
3. 마지막 글자는 마침표 및 특수기호 사용금지
4. 개조식 구문으로 작성(간결하고 요점적으로 서술)
5. 필요시, 이슈 트래킹 번호 추가 가능 [#이슈 번호]


#### Body 작성 규칙
1. 본문은 선택사항이며, 최대한 상세히 작성
2. 내용은 "어떻게" 보단 "무엇을", "왜" 변경했는지 작성
3. 각 줄의 길이는 72자 이내로 작성
4. 글머리 기호도 사용 가능. 하이픈(-), 별표(*)

#### 커밋 타입
아이콘 사용시 [GitMoji](https://gitmoji.dev/)를 이용합니다.
- **✨ Feat** 새로운 기능 추가
- **🐛 Fix** 버그 수정
- **🗃️ Refactor** 코드 리팩토링
- **🔥 Perf** 성능 개선
- **🔨 Chore** 기타 변경사항
- **🚧 Style** 스타일 수정 (줄 공백 등)
- **📝 Docs** 문서 수정
- **🚩 Test** 테스트 관련 코드
