class SqlcGoOneOrFail < Formula
  desc 'Modify the Go code generated by sqlc to fail if more than one record is retrieved in the `:one` command.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/sqlc-go-one-or-fail'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/sqlc-go-one-or-fail/releases/download/v0.2.0/sqlc-go-one-or-fail_v0.2.0_darwin_arm64.zip'
      sha256 '38b2910f6e39e7f7f475b564a4461202ea61c3ed46cb8b29cbf3b5ecc717e9a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/sqlc-go-one-or-fail/releases/download/v0.2.0/sqlc-go-one-or-fail_v0.2.0_darwin_amd64.zip'
      sha256 '29735b2f6b2d7fb06993d2d5d5c195d114702d5e33349b588a64df9dbc9cf63a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/sqlc-go-one-or-fail/releases/download/v0.2.0/sqlc-go-one-or-fail_v0.2.0_linux_arm64.tar.gz'
      sha256 'e45134d90ada671492232bdd73891f87178331b8e5be9428f40056cc3bd91a6b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/sqlc-go-one-or-fail/releases/download/v0.2.0/sqlc-go-one-or-fail_v0.2.0_linux_amd64.tar.gz'
      sha256 '251917fdb702c333e0191aadfa8b1eb242aebf56511bea106799ba3a9c6d847d'
    end
  end

  head do
    url 'https://github.com/k1LoW/sqlc-go-one-or-fail.git'
    depends_on 'go' => :build
  end

  def install
    system 'make', 'build' if build.head?
    bin.install 'sqlc-go-one-or-fail'
    generate_completions_from_executable(bin/'sqlc-go-one-or-fail', 'completion')
  end
end