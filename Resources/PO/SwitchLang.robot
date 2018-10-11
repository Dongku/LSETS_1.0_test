*** Settings ***
Library           Selenium2Library
Library           XML
Resource          Landing.robot

*** Keywords ***
Landing_Mode
    Verify Title Page
    Verify CopyRight
    Verify Logo is Existing
    Verify Custom Header
    Capture Page Screenshot
    ${XMLFile}=    Set Variable    ${XMLPATH}XMLConfig.xml
    ${Domainname1}=    Get Element Text    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[1]
    ${Domainname2}=    Get Element Text    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[2]
    Comment    ${Domainname3}=    Get Element    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[3]
    Comment    ${Domainname4}=    Get Element    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[4]
    Set Global Variable    @{LANG[1]}    ${Domainname1}
    Set Global Variable    @{LANG[2]}    ${Domainname2}
    Comment    Set Global Variable    @{LANG[3]}    ${Domainname3}
    Comment    Set Global Variable    @{LANG[4]}    ${Domainname4}
    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname1}
    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname2}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname3}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname4}
    Click Element    xpath=//*[@id="btnTranslate"]
    Element Should Contain    //*[@id="buttontranslate"]    Translate
    Element Should Contain    xpath=//*[@id="buttonreset"]    Reset
    Element Should Contain    xpath=//*[@id="buttoncopy"]    Copy
    Click Image    xpath=//*[@id="imgLanguages"]
    Verify Language List
    Page Should Contain    Text
    Page Should Contain    Translated Text
    Page Should Contain    Enter text here...
    Page Should Contain    Text translation...
    Click Element    xpath=//*[@id="imgClear"]
    Element Should Contain    xpath=//*[@id="lblLimit"]    0/5000
    Page Should Contain    Document(s)
    Element Should Contain    xpath=//*[@id="draglabel1"]    Drag and Drop Files
    Element Should Contain    xpath=//*[@id="draglabel2"]    into this Box
    Element Should Contain    xpath=//*[@id="draglabel3"]    or
    Element Should Contain    xpath=//*[@id="buttonbrowse"]    Browse for Files
    Element Should Contain    xpath=//*[@id="documentoutputformatlabel"]    Output Format
    Element Should Contain    //*[@id="sameasdocumentlabel"]    Same as Document
    Element Should Contain    //*[@id="htmllabel"]    HTML
    Element Should Contain    //*[@id="textlabel"]    Text file
    Element Should Contain    //*[@id="documentaftertranslationlabel"]    After Translation
    Element Should Contain    //*[@id="downloadlabel"]    Download Document
    Element Should Contain    //*[@id="emaildocumentlabel"]    Email Document as Attachment
    Element Should Not Contain    //*[@id="txtEmail"]    @
    Click Image    //*[@id="imgSupport"]
    Capture Page Screenshot

English_Mode
    Click Element    //*[@id="PageLangSelect"]/option[1]
    Verify Title Page
    Verify CopyRight
    Verify Logo is Existing
    ${XMLFile}=    Set Variable    ${XMLPATH}XMLConfig.xml
    ${pageheading}=    Get Element Text    ${XMLFile}    display/lang[@id="en"]/heading/pageheading
    Page Should Contain    ${pageheading}
    Capture Page Screenshot
    ${Domainname1}=    Get Element Text    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[1]
    ${Domainname2}=    Get Element Text    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[2]
    Comment    ${Domainname3}=    Get Element    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[3]
    Comment    ${Domainname4}=    Get Element    ${XMLFile}    display/lang[@id="en"]/domainnamemapping/domain[4]
    Set Global Variable    @{LANG[1]}    ${Domainname1}
    Set Global Variable    @{LANG[2]}    ${Domainname2}
    Comment    Set Global Variable    @{LANG[3]}    ${Domainname3}
    Comment    Set Global Variable    @{LANG[4]}    ${Domainname4}
    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname1}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname2}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname3}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname4}
    Click Element    xpath=//*[@id="btnTranslate"]
    Element Should Contain    //*[@id="buttontranslate"]    Translate
    Element Should Contain    xpath=//*[@id="buttonreset"]    Reset
    Element Should Contain    xpath=//*[@id="buttoncopy"]    Copy
    Click Image    xpath=//*[@id="imgLanguages"]
    Verify Language List
    Page Should Contain    Text
    Page Should Contain    Translated Text
    Page Should Contain    Enter text here...
    Page Should Contain    Text translation...
    Click Element    xpath=//*[@id="imgClear"]
    Element Should Contain    xpath=//*[@id="lblLimit"]    0/5000
    Page Should Contain    Document(s)
    Element Should Contain    xpath=//*[@id="draglabel1"]    Drag and Drop Files
    Element Should Contain    xpath=//*[@id="draglabel2"]    into this Box
    Element Should Contain    xpath=//*[@id="draglabel3"]    or
    Element Should Contain    xpath=//*[@id="buttonbrowse"]    Browse for Files
    Element Should Contain    xpath=//*[@id="documentoutputformatlabel"]    Output Format
    Element Should Contain    //*[@id="sameasdocumentlabel"]    Same as Document
    Element Should Contain    //*[@id="htmllabel"]    HTML
    Element Should Contain    //*[@id="textlabel"]    Text file
    Element Should Contain    //*[@id="documentaftertranslationlabel"]    After Translation
    Element Should Contain    //*[@id="downloadlabel"]    Download Document
    Element Should Contain    //*[@id="emaildocumentlabel"]    Email Document as Attachment
    Element Should Not Contain    //*[@id="txtEmail"]    @
    Click Image    //*[@id="imgSupport"]
    Capture Page Screenshot

French_Mode
    Click Element    //*[@id="PageLangSelect"]/option[2]
    Verify Title Page
    Verify CopyRight
    Verify Logo is Existing
    ${XMLFile}=    Set Variable    ${XMLPATH}XMLConfig.xml
    ${pageheading}=    Get Element Text    ${XMLFile}    display/lang[@id="fr"]/heading/pageheading
    Page Should Contain    ${pageheading}
    Capture Page Screenshot
    ${Domainname1}=    Get Element Text    ${XMLFile}    display/lang[@id="fr"]/domainnamemapping/domain[1]
    Comment    ${Domainname2}=    Get Element Text    ${XMLFile}    display/lang[@id="fr"]/domainnamemapping/domain[2]
    Comment    ${Domainname3}=    Get Element    ${XMLFile}    display/lang[@id="fr"]/domainnamemapping/domain[3]
    Comment    ${Domainname4}=    Get Element    ${XMLFile}    display/lang[@id="fr"]/domainnamemapping/domain[4]
    Set Global Variable    @{LANG[1]}    ${Domainname1}
    Comment    Set Global Variable    @{LANG[2]}    ${Domainname2}
    Comment    Set Global Variable    @{LANG[3]}    ${Domainname3}
    Comment    Set Global Variable    @{LANG[4]}    ${Domainname4}
    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname1}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname2}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname3}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname4}
    Click Element    xpath=//*[@id="btnTranslate"]
    Element Should Contain    //*[@id="buttontranslate"]    Traduire
    Element Should Contain    xpath=//*[@id="buttonreset"]    Réinitialiser
    Element Should Contain    xpath=//*[@id="buttoncopy"]    Copie
    Click Image    xpath=//*[@id="imgLanguages"]
    Verify Language List
    Page Should Contain    Texte
    Page Should Contain    Texte traduit
    Page Should Contain    Entrez le texte ici...
    Page Should Contain    Traduction du texte...
    Click Element    xpath=//*[@id="imgClear"]
    Element Should Contain    xpath=//*[@id="lblLimit"]    0/5000
    Page Should Contain    Document(s)
    Element Should Contain    xpath=//*[@id="draglabel1"]    Glisser-déposer des fichiers
    Element Should Contain    xpath=//*[@id="draglabel2"]    dans cette boîte
    Element Should Contain    xpath=//*[@id="draglabel3"]    Ou
    Element Should Contain    xpath=//*[@id="buttonbrowse"]    Rechercher des fichiers
    Element Should Contain    xpath=//*[@id="documentoutputformatlabel"]    Format de sortie
    Element Should Contain    //*[@id="sameasdocumentlabel"]    Même que le document
    Element Should Contain    //*[@id="htmllabel"]    HTML
    Element Should Contain    //*[@id="textlabel"]    Fichier texte
    Element Should Contain    //*[@id="documentaftertranslationlabel"]    Après la traduction
    Element Should Contain    //*[@id="downloadlabel"]    Télécharger le document
    Element Should Contain    //*[@id="emaildocumentlabel"]    Envoyer le document par courriel en pièce jointe
    Element Should Not Contain    //*[@id="txtEmail"]    @
    Click Image    //*[@id="imgSupport"]
    Capture Page Screenshot

Chinese_Mode
    Click Element    //*[@id="PageLangSelect"]/option[3]
    Verify Title Page
    Verify CopyRight
    Verify Logo is Existing
    ${XMLFile}=    Set Variable    ${XMLPATH}XMLConfig.xml
    ${pageheading}=    Get Element Text    ${XMLFile}    display/lang[@id="zh"]/heading/pageheading
    Page Should Contain    ${pageheading}
    Capture Page Screenshot
    ${Domainname1}=    Get Element Text    ${XMLFile}    display/lang[@id="zh"]/domainnamemapping/domain[1]
    Comment    ${Domainname2}=    Get Element Text    ${XMLFile}    display/lang[@id="zh"]/domainnamemapping/domain[2]
    Comment    ${Domainname3}=    Get Element    ${XMLFile}    display/lang[@id="zh"]/domainnamemapping/domain[3]
    Comment    ${Domainname4}=    Get Element    ${XMLFile}    display/lang[@id="zh"]/domainnamemapping/domain[4]
    Set Global Variable    @{LANG[1]}    ${Domainname1}
    Comment    Set Global Variable    @{LANG[2]}    ${Domainname2}
    Comment    Set Global Variable    @{LANG[3]}    ${Domainname3}
    Comment    Set Global Variable    @{LANG[4]}    ${Domainname4}
    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname1}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname2}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname3}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname4}
    Click Element    xpath=//*[@id="btnTranslate"]
    Element Should Contain    //*[@id="buttontranslate"]    翻译
    Element Should Contain    xpath=//*[@id="buttonreset"]    重启
    Element Should Contain    xpath=//*[@id="buttoncopy"]    复制
    Click Image    xpath=//*[@id="imgLanguages"]
    Verify Language List
    Page Should Contain    文本
    Page Should Contain    翻译文本
    Page Should Contain    在此输入文字…
    Page Should Contain    文字翻译...
    Click Element    xpath=//*[@id="imgClear"]
    Element Should Contain    xpath=//*[@id="lblLimit"]    0/5000
    Page Should Contain    文件
    Element Should Contain    xpath=//*[@id="draglabel1"]    拖放文件
    Element Should Contain    xpath=//*[@id="draglabel2"]    进入这个盒子
    Element Should Contain    xpath=//*[@id="draglabel3"]    要么
    Element Should Contain    xpath=//*[@id="buttonbrowse"]    浏览文件
    Element Should Contain    xpath=//*[@id="documentoutputformatlabel"]    输出格式
    Element Should Contain    //*[@id="sameasdocumentlabel"]    与文档相同
    Element Should Contain    //*[@id="htmllabel"]    超文本标记语言
    Element Should Contain    //*[@id="textlabel"]    文本文件
    Element Should Contain    //*[@id="documentaftertranslationlabel"]    翻译后
    Element Should Contain    //*[@id="downloadlabel"]    下载文件
    Element Should Contain    //*[@id="emaildocumentlabel"]    电子邮件文档作为附件
    Element Should Not Contain    //*[@id="txtEmail"]    @
    Click Image    //*[@id="imgSupport"]
    Capture Page Screenshot

Thai_Mode
    Click Element    //*[@id="PageLangSelect"]/option[4]
    Verify Title Page
    Verify CopyRight
    Verify Logo is Existing
    ${XMLFile}=    Set Variable    ${XMLPATH}XMLConfig.xml
    ${pageheading}=    Get Element Text    ${XMLFile}    display/lang[@id="th"]/heading/pageheading
    Page Should Contain    ${pageheading}
    Capture Page Screenshot
    ${Domainname1}=    Get Element Text    ${XMLFile}    display/lang[@id="th"]/domainnamemapping/domain[1]
    Comment    ${Domainname2}=    Get Element Text    ${XMLFile}    display/lang[@id="th"]/domainnamemapping/domain[2]
    Comment    ${Domainname3}=    Get Element    ${XMLFile}    display/lang[@id="th"]/domainnamemapping/domain[3]
    Comment    ${Domainname4}=    Get Element    ${XMLFile}    display/lang[@id="th"]/domainnamemapping/domain[4]
    Set Global Variable    @{LANG[1]}    ${Domainname1}
    Comment    Set Global Variable    @{LANG[2]}    ${Domainname2}
    Comment    Set Global Variable    @{LANG[3]}    ${Domainname3}
    Comment    Set Global Variable    @{LANG[4]}    ${Domainname4}
    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname1}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname2}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname3}
    Comment    Element Should Contain    xpath=//*[@id="selEngine"]    ${Domainname4}
    Click Element    xpath=//*[@id="btnTranslate"]
    Element Should Contain    //*[@id="buttontranslate"]    แปล
    Element Should Contain    xpath=//*[@id="buttonreset"]    ล้าง
    Element Should Contain    xpath=//*[@id="buttoncopy"]    คัดลอก
    Click Image    xpath=//*[@id="imgLanguages"]
    Verify Language List
    Page Should Contain    ข้อความ
    Page Should Contain    ผลการแปล
    Page Should Contain    พิมพ์ข้อความ...
    Page Should Contain    ผลการแปล...
    Click Element    xpath=//*[@id="imgClear"]
    Element Should Contain    xpath=//*[@id="lblLimit"]    0/5000
    Page Should Contain    เอกสาร
    Element Should Contain    xpath=//*[@id="draglabel1"]    ลากและวางไฟล์
    Element Should Contain    xpath=//*[@id="draglabel2"]    บริเวณนี้
    Element Should Contain    xpath=//*[@id="draglabel3"]    หรือ
    Element Should Contain    xpath=//*[@id="buttonbrowse"]    เลือกไฟล์
    Element Should Contain    xpath=//*[@id="documentoutputformatlabel"]    รูปแบบผลลัพธ์
    Element Should Contain    //*[@id="sameasdocumentlabel"]    เหมือนเอกสารต้นฉบับ
    Element Should Contain    //*[@id="htmllabel"]    HTML
    Element Should Contain    //*[@id="textlabel"]    ไฟล์ข้อความ
    Element Should Contain    //*[@id="documentaftertranslationlabel"]    การรับผลการแปล
    Element Should Contain    //*[@id="downloadlabel"]    ดาวน์โหลดเอกสาร
    Element Should Contain    //*[@id="emaildocumentlabel"]    ส่งอีเมล์
    Element Should Not Contain    //*[@id="txtEmail"]    @
    Click Image    //*[@id="imgSupport"]
    Capture Page Screenshot
