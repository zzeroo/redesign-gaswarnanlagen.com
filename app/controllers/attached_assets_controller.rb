# Controller for Attachments
#
# This is the Controller for them.
class AttachedAssetsController < ApplicationController
  before_action :set_attached_asset, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :update, :destroy]



  # DELETE /attached_assets/1
  # DELETE /attached_assets/1.json
  def destroy
    @attached_asset.destroy
    respond_to do |format|
      format.html { render :nothing => true }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attached_asset
      @attached_asset = AttachedAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attached_assets_params
      params.require(:attached_asset).permit(:asset)
    end
end

