swagger: '2.0'
info:
  version: '1.7'
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
          description: Text to enrich
          required: true
          schema:
            $ref: '#/definitions/AnalysisRequestType'
      responses:
        '201':
          description: AnalysisResponseType
    delete:
      description: "Delete index and all assets in it  \n"
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
      description: "Obtain asset keywords"
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
  '/{indexid}/search-managed':
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
          description: Text to enrich
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
        type:
          string
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
      - indexId
      - assetId
      - assetUri
    properties:
      indexId:
        type: string
      genre:
        $ref: '#/definitions/Genre'
      structuralAnalysisConfig:
        $ref: '#/definitions/StructuralAnalysisConfig'
      speechRecognitionConfig:
        $ref: '#/definitions/SpeechRecognitionConfig'
      speakerRecognitionConfig:
        $ref: '#/definitions/SpeakerRecognitionConfig'
      externalMetadata:
        type: string
      assetId:
        type: string
      assetUri:
        type: string
      assetTitle:
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
    type: array
    items:
      type: string