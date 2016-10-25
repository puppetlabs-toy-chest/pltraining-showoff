require "spec_helper"

describe "showoff" do
  let(:node) { 'test.example.com' }

  let(:facts) { {
    :os => {
      :family => 'RedHat',
      :release => {
        :major => '7',
        :minor => '2',
      }
    },
  } }

  it { is_expected.to compile.with_all_deps }

end
