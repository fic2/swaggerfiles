swagger: '2.0'
info:
  version: '1.6.3'
  title: Audio Mining SE
  description: Analyze and explore audio visual media
  termsOfService: 'see http://mediafi.org/?portfolio=audio-mining#tab-terms-conditions'
  contact:
    name: Heike Horstmann
    email: heike.horstmann@iais.fraunhofer.de
    url: 'http://mediafi.org/?portfolio=audio-mining'
host: '195.220.224.14:49154'
basePath: /
schemes:
  - http
consumes:
  - application/json
produces:
  - application/json
paths:
  /:
    post:
      description: Create a new index
      consumes:
        - application/json
      produces: 
        - application/json
      parameters:
        - name: indexid
          in: query
          description: Desired index name
          required: true
          type: string
        - name: language
          in: query
          description: Desired language
          required: true
          type: string
      responses:
        '201':
          description: ObjectUpdateResponseType
  '/{indexid}/':
    post:
      description: "Insert a new asset and analyze it \n"
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - in: body
          name: body
          description: AnalysisRequestType
          required: true
          schema:
            $ref: '#/definitions/AnalysisRequestType'
      responses:
        '201':
          description: AnalysisResponseType
    delete:
      description: "Delete index and all assets in it  \n"
      consumes:
        - application/json
      produces: 
        - application/json
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
      responses:
        '200':
          description: ObjectUpdateResponseType
    get:
      description: "List all assets of an index \n"
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
      responses:
        '201':
          description: AssetListResponse
  '/{indexid}/{assetid}/':
    delete:
      description: "Delete a single asset \n"
      consumes:
        - application/json
      produces: 
        - application/json
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - name: assetid
          in: path
          description: Desired asset
          required: true
          type: string
      responses:
        '200':
          description: ObjectUpdateResponseType
    get:
      description: "Obtain plain asset metadata \n"
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - name: assetid
          in: path
          description: Desired asset
          required: true
          type: string
      responses:
        '200':
          description: Mpeg7
  '/{indexid}/{assetid}/transcript':
    get:
      description: "Obtain asset transcript \n"
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - name: assetid
          in: path
          description: Desired asset
          required: true
          type: string
      responses:
        '200':
          description: TranscriptResponseType
  '/{indexid}/{assetid}/keywords':
    get:
      description: Obtain asset keywords
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - name: assetid
          in: path
          description: Desired asset
          required: true
          type: string
      responses:
        '200':
          description: KeywordResponseType
  '/{indexid}/{assetid}/status':
    get:
      description: "Obtain asset status \n"
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - name: assetid
          in: path
          description: Desired asset
          required: true
          type: string
      responses:
        '200':
          description: AssetStatusResponseType
  '/{indexid}/{assetid}/structure':
    get:
      description: |
        Obtain asset segmentation structure
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - name: assetid
          in: path
          description: Desired asset
          required: true
          type: string
      responses:
        '200':
          description: StructureResponseType
  '/{indexid}/{assetid}/subtitles':
    get:
      description: "Obtain asset subtitles in SRT format \n"
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - name: assetid
          in: path
          description: Desired asset
          required: true
          type: string
      responses:
        '200':
          description: text/plain
  '/{indexid}/searcher-managed':
    post:
      description: "Send a search request \n"
      parameters:
        - name: indexid
          in: path
          description: Index to be used
          required: true
          type: string
        - in: body
          name: body
          description: SearchRequestType
          required: true
          schema:
            $ref: '#/definitions/SearchRequestType'
      responses:
        '200':
          description: SearchResponseType
definitions:
  SearchRequestType:
    required:
      - query
      - indexID
      - searchType
    properties:
      query:
        type: string
      relevantMediaAssetID:
        type: array
        items:
          type: string
      indexID:
        type: string
      searchType:
        type: string
        enum:
          - word
      context:
        type: boolean
      contextDuration:
        type: integer
      similarity:
        type: integer
      offset:
        type: integer
      limit:
        type: integer
      documentContextSize:
        type: integer
      speakerID:
        type: string
  AnalysisRequestType:
    required:
      - indexID
      - assetID
      - assetURI
    properties:
      genre:
        $ref: '#/definitions/Genre'
      speechRecognitionConfig:
        $ref: '#/definitions/SpeechRecognitionConfig'
      structuralAnalysisConfig:
        $ref: '#/definitions/StructuralAnalysisConfig'
      speakerRecognitionConfig:
        $ref: '#/definitions/SpeakerRecognitionConfig'
      externalMetadata:
        $ref: '#/definitions/ExternalMetadata'
      assetID:
        type: string
      assetURI:
        type: string
      assetTitle:
        type: string
      indexID:
        type: string
      creationDate:
        type: integer
  Genre:
    properties:
      name:
        type: array
        items:
          type: string
      definition:
        type: array
        items:
          type: string
      term:
        type: array
        items:
          type: string
      href:
        type: string
  StructuralAnalysisConfig:
    properties:
      segmentationFlag:
        type: boolean
      speechDetectionFlag:
        type: boolean
      speakerClusteringFlag:
        type: boolean
      genderDetectionFlag:
        type: boolean
  SpeechRecognitionConfig:
    properties:
      wordRecognitionFlag:
        type: boolean
  SpeakerRecognitionConfig:
    properties:
      speakerRecognitionList:
        type: array
        items:
          type: string
  ExternalMetadata:
    properties:
      Titles:
        type: array
        items:
          $ref: '#/definitions/TitleType'
      Identifiers:
        type: array
        items:
          $ref: '#/definitions/IdentifierType'
      Abstract:
        type: string
      Descriptors:
        type: array
        items:
          $ref: '#/definitions/DescriptorType'
      Person:
        type: array
        items:
          $ref: '#/definitions/PersonType'
      Dates:
        type: array
        items:
          $ref: '#/definitions/DateType'
  TitleType:
    required:
      - Type
      - Title
    properties:
      Type: 
        type: string
      Title:
        type: string
  IdentifierType:
    required:
      - Type
      - Identifier
    properties:
      Type: 
        type: string
      Identifier:
        type: string
  DescriptorType:
    required:
      - Type
      - Descriptor
    properties:
      Type: 
        type: string
      Descriptor:
        type: string
      Identifier:
        type: string
  PersonType:
    required:
      - Name
      - Display
    properties:
      Name: 
        type: string
      Display:
        type: string
      Role:
        type: string
      Identifier:
        type: string
  DateType:
    required:
      - Type
      - Date
    properties:
      Type: 
        type: string
      Date:
       type: integer