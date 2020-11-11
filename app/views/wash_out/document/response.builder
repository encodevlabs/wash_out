xml.instruct!
xml.tag! "soap:Envelope", "xmlns:soap" => 'http://www.w3.org/2003/05/soap-envelope',
                          "xmlns:xsd" => 'http://www.w3.org/2001/XMLSchema',
                          "xmlns:xsi" => 'http://www.w3.org/2001/XMLSchema-instance'
                          do
  if !header.nil?
    xml.tag! "soap:Header" do
      xml.tag! "#{@action_spec[:response_tag]}" do
        wsdl_data xml, header
      end
    end
  end
  xml.tag! "soap:Body" do
    xml.tag! "#{@action_spec[:response_tag]}", 'xmlns' => 'http://letshego.com/webservices/nibss/v1/' do
      wsdl_data xml, result
    end
  end
end
