module Octokiq
  class CMD
    def run
      puts logo
      server.start
    rescue Interrupt
      Octokiq.logger.info 'Bye!'
    end

    private

    def server
      @server ||= Server.new
    end

    def logo
      <<-EOF
      _,gggggg,_                                                                 
      ,d8P""d8P"Y8b,                I8                 ,dPYb,                      
     ,d8'   Y8   "8b,dP             I8                 IP'`Yb                      
     d8'    `Ybaaad88P'          88888888              I8  8I      gg              
     8P       `""""Y8               I8                 I8  8bgg,   ""              
     8b            d8     ,gggg,    I8      ,ggggg,    I8 dP" "8   gg     ,gggg,gg 
     Y8,          ,8P    dP"  "Yb   I8     dP"  "Y8ggg I8d8bggP"   88    dP"  "Y8I 
     `Y8,        ,8P'   i8'        ,I8,   i8'    ,8I   I8P' "Yb,   88   i8'    ,8I 
      `Y8b,,__,,d8P'   ,d8,_    _ ,d88b, ,d8,   ,d8'  ,d8    `Yb,_,88,_,d8,   ,d8b 
        `"Y8888P"'     P""Y8888PP 8P""Y8 P"Y8888P"    88P      Y88P""Y8P"Y8888P"88d
                                                                                I8P
                                                                                I8'
                                                                                I8 
                                                                                I8 
                                                                                I8 
                                                                                I8 
      EOF
    end
  end
end
