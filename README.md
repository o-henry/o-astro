# AstroNvim VS Code Glass Preset

첨부한 VS Code 스크린샷처럼 보이도록 AstroNvim을 다듬은 사용자 설정입니다.

포함한 방향은 아래와 같습니다.

- `vscode.nvim` 기반 색상으로 VS Code 다크 톤에 가깝게 맞춤
- 메인 편집 영역과 사이드바를 투명하게 만들어 유리창 느낌 강화
- `neo-tree` 폭, 아이콘, 추적 동작을 VS Code 탐색기 쪽 감성으로 조정
- 숫자 줄번호, VS Code 스타일 상단 탭, 들여쓰기 가이드, 부드러운 구분선 스타일 적용

## 설치

현재 `~/.config/nvim` 을 이 폴더 내용으로 교체하거나, 새 AstroNvim 사용자 설정 저장소로 사용하면 됩니다.

```bash
cp -R /Users/henry/Documents/code/vibe/hybrid/astro ~/.config/nvim
```

그다음 Neovim을 열면 `lazy.nvim` 과 AstroNvim 관련 플러그인이 자동 설치됩니다.

```bash
nvim
```

## 중요한 점

스크린샷 같은 "배경 사진 + 반투명 창" 효과는 AstroNvim만으로는 완전히 나오지 않습니다.

- 코드 색감, 탭, 사이드바 스타일: AstroNvim 설정에서 처리
- 배경 이미지, 윈도우 투명도, blur: 터미널 에뮬레이터 또는 GUI 클라이언트에서 처리

즉, 이 설정은 "에디터 내부 스타일"을 맞추는 부분이고, 배경 사진은 별도로 터미널 쪽에서 넣어야 합니다.

## 추천 조합

- 폰트: `JetBrainsMono Nerd Font` 또는 `CaskaydiaCove Nerd Font`
- 터미널: WezTerm, Ghostty, Kitty
- 배경 이미지: 어두운 사진을 낮은 opacity로 깔기

`extras/wezterm-glass.lua` 는 WezTerm에서 바로 참고할 수 있는 예시입니다.

배경 이미지를 쓰려면 아래 파일 경로를 실제 이미지로 바꿔 주세요.

```lua
os.getenv "HOME" .. "/Pictures/astronvim-wallpaper.jpg"
```

## 파일 구조

- `init.lua`: lazy.nvim 부트스트랩
- `lua/lazy_setup.lua`: AstroNvim 및 사용자 플러그인 로드
- `lua/plugins/astroui.lua`: VS Code 테마 적용
- `lua/plugins/astrocore.lua`: 기본 옵션, 진단, 키맵
- `lua/plugins/neotree.lua`: 사이드바 탐색기 튜닝
- `lua/plugins/bufferline.lua`: VS Code 스타일 상단 탭
- `lua/plugins/indent_guides.lua`: 들여쓰기 가이드
- `lua/polish.lua`: 투명도와 최종 하이라이트 마감
