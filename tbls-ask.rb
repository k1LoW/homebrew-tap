class TblsAsk < Formula
  desc 'tbls-ask is an external subcommand of tbls for asking OpenAI using the datasource.'
  version '0.6.4'
  homepage 'https://github.com/k1LoW/tbls-ask'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.4/tbls-ask_v0.6.4_darwin_arm64.zip'
      sha256 'ce53be61658be31e175c7f64527dd1c3b038f361198288689e5afc2e175fd0e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.4/tbls-ask_v0.6.4_darwin_amd64.zip'
      sha256 '37e7a014e7e63ca4fbdfc6aab8b88f290760c814e39f87044ea5229c3099ce81'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.4/tbls-ask_v0.6.4_linux_arm64.tar.gz'
      sha256 'ab7f2a4ee287e20c0d7cccfb67158dee0857f0ac9a2266e74e79095ed0c48dd6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-ask/releases/download/v0.6.4/tbls-ask_v0.6.4_linux_amd64.tar.gz'
      sha256 '432ebca7081e706fe4b4f3df2456221188d442cd780d4e3198c5325ee329ec81'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-ask.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-ask'
  end
end
