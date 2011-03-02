require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "A command of 'bonfire new'" do
  before(:each) do
    @tmp_dir = "#{Dir.tmpdir}/bonfire"
    FileUtils.rm_r @tmp_dir if File.exists?(@tmp_dir)
    FileUtils.mkdir_p @tmp_dir

    @thor = Thor.new
  end

  describe "with a name" do
    before :each do
      Dir.chdir @tmp_dir do
        @thor.invoke Bonfire, "new", "my_book"
      end
    end

    describe "should make a project directory and it" do

      it "should make a parent directory" do
        Dir.chdir "#{@tmp_dir}" do
          File.directory?('my_book').should be_true
        end
      end

      it "should make a directory for the source" do
        Dir.chdir "#{@tmp_dir}/my_book" do
          File.directory?('source').should be_true
        end
      end

      it "should make a top-level YAML file for meta-data" do
        Dir.chdir "#{@tmp_dir}/my_book/source" do
          File.exist?('my_book.yml').should be_true
        end
      end


      it "should make a directory for the "



    end




  end

#describe "without a name" do
#  before(:each) do
#
#  end
#
#end
#
## shared example group
#it "should layout the correct directory structure"
#
#it "should add a "
#
#it "should add an .rvmrc"
#
#it "should init a git repo"


end
