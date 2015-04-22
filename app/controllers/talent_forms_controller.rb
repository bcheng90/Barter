class TalentFormsController < ApplicationController
    skip_before_action :set_default_response_format

  def new
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201)
    @talent = Talent.new
    render text: @s3_direct_post.fields.to_json.html_safe
  end

end