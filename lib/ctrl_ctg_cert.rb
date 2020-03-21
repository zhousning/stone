module CtrlCtgCert
  def index_base(that)
    clazz_underscore, param = produce_var(that)
    eval(
         "@#{clazz_underscore} = #{that}.find(#{param}) \n" +
         "@#{clazz_underscore}_certs = @#{clazz_underscore}.#{clazz_underscore}_certs"
        )
  end

  def new_base(that)
    clazz_underscore, param = produce_var(that)
    eval(
         "@#{clazz_underscore} = #{that}.find(#{param}) \n" +
         "@#{clazz_underscore}_cert = #{that}Cert.new \n" +
         "certs(@#{clazz_underscore}_cert, Setting.cert_ctgs.#{clazz_underscore})"
        )
  end

  def create_base(that)
    clazz_underscore, param = produce_var(that)
    eval(
         "@#{clazz_underscore} = #{that}.find(#{param}) \n" +
         "@#{clazz_underscore}_cert = #{that}Cert.new(#{clazz_underscore}_cert_params) \n" +
         "@#{clazz_underscore}_cert.#{clazz_underscore} = @#{clazz_underscore}"
        )
    if eval("@#{clazz_underscore}_cert.save")
      certs = params["cert"]
      cert_hash = hash_cert(certs)
      cert_hash.each do |k, v|
        eval("@idnumber = @#{clazz_underscore}_cert.idnumber")
        CertShip.create(:level => v, :foreign_idnumber => @idnumber, :cert_ctg_id => k)
      end
      eval("redirect_to edit_#{clazz_underscore}_#{clazz_underscore}_cert_url(@#{clazz_underscore}, @#{clazz_underscore}_cert)")
    else
      eval("certs(@#{clazz_underscore}_cert, Setting.cert_ctgs.#{clazz_underscore})")
      render :new
    end
  end

  def edit_base(that)
    clazz_underscore, param = produce_var(that)
    eval(
         "@#{clazz_underscore} = #{that}.find(#{param}) \n" +
         "@#{clazz_underscore}_cert = @#{clazz_underscore}.#{clazz_underscore}_certs.find(params[:id])"
        )
    eval("certs(@#{clazz_underscore}_cert, Setting.cert_ctgs.#{clazz_underscore})")
  end
   

   
  def update_base(that)
    clazz_underscore, param = produce_var(that)
    eval(
         "@#{clazz_underscore} = #{that}.find(#{param}) \n" +
         "@#{clazz_underscore}_cert = @#{clazz_underscore}.#{clazz_underscore}_certs.find(params[:id])"
        )
    certs = params["cert"]
    cert_hash = hash_cert(certs)
    eval("@#{clazz_underscore}_cert.cert_ctgs.delete_all")
    cert_hash.each do |k, v|
      eval("@idnumber = @#{clazz_underscore}_cert.idnumber")
      CertShip.create(:level => v, :foreign_idnumber => @idnumber, :cert_ctg_id => k)
    end

    if eval("@#{clazz_underscore}_cert.update(#{clazz_underscore}_cert_params)")
      eval("redirect_to edit_#{clazz_underscore}_#{clazz_underscore}_cert_url(@#{clazz_underscore}, @#{clazz_underscore}_cert)")
    else
      eval("certs(@#{clazz_underscore}_cert, Setting.cert_ctgs.#{clazz_underscore})")
      render :edit
    end
  end

   

   
  def destroy_base(that)
    clazz_underscore, param = produce_var(that)
    eval(
         "@#{clazz_underscore} = #{that}.find(#{param}) \n" +
         "@#{clazz_underscore}_cert = @#{clazz_underscore}.#{clazz_underscore}_certs.find(params[:id]) \n" +
         "@#{clazz_underscore}_cert.destroy"
        )
    redirect_to :action => :index
  end


  private
    def produce_var(that)
      clazz = Object.const_get(that)
      clazz_underscore = that.underscore
      param_sym = (clazz_underscore + "_id").to_sym
      param = params[param_sym]
      [clazz_underscore, param]
    end

end
