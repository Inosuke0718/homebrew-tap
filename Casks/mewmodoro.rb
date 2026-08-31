cask "mewmodoro" do
  version "1.1.4"
  sha256 "0248d83317d47899521c283a8494b4e72b49ce6ca76a444f072015971ea604ab"

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
