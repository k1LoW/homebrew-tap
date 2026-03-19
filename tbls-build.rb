class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.8.2'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.2/tbls-build_v0.8.2_darwin_arm64.zip'
      sha256 '1c1545b619eaa0a389e88339eb5c744d6c34636ac256d244236b532594f7a241'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.2/tbls-build_v0.8.2_darwin_amd64.zip'
      sha256 'd560cefcd3713fb53f3caaa94ec07fd88ca417a3e4511942c6d90bfcefa97329'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.2/tbls-build_v0.8.2_linux_arm64.tar.gz'
      sha256 '894901d1fcf0fc373f24d42b3af31af00bd02760cf28292afae4a6a9deeda5f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.2/tbls-build_v0.8.2_linux_amd64.tar.gz'
      sha256 'f9561a96975a1b4152b32224244c2bda0670e0ae43134b98859f3cbc1c2203bd'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-build.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-build'
    generate_completions_from_executable(bin/'tbls-build', 'completion')
  end
end
