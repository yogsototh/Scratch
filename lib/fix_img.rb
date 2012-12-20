class FixImage < Nanoc3::Filter
    identifier :fix_img
    def run(content, params={})
        content.gsub(%r{<p>(<img[^>]*>)</p>}) do |m|
	        $1.to_s
		end
    end
end
