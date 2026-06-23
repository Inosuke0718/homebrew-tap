cask "mewmodoro" do
  version "1.1.4"
  sha256 "8c075f49fe21f083e14b3bfe3c778299f580535630dfd083f626dc045c9e23b5"

  url "https://github.com/Inosuke0718/mewmodoro-releases/releases/download/v#{version}/Mewmodoro-Setup-#{version}.dmg"
  name "Mewmodoro"
  desc "デスクトップ常駐ポモドーロ猫マスコット"
  homepage "https://kiki-neko.com/"

  app "Mewmodoro.app"

  # インストール後に検疫属性を自動除去（未署名アプリのため）
  # ※ --no-quarantine が廃止されたので、cask側で xattr を直接実行する
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mewmodoro.app"]
  end

  zap trash: [
    "~/Library/Application Support/Mewmodoro",
    "~/Library/Preferences/com.mewmodoro.app.plist",
    "~/Library/Saved Application State/com.mewmodoro.app.savedState",
    "~/Library/Logs/Mewmodoro",
  ]
end
