Feature: Certificate creation

  Background: User has a valid wallet
    Given user1 is a brand

  Scenario: User wants to read certificate
    Given user1 buys 1 credit of type creation
    Given user1 creates a new certificate0 with uri "https://api.myjson.com/bins/cf4ph" and passphrase MyPassPhrase
    Given user1 want to see certificate0 details with passphrase MyPassPhrase

  Scenario: User wants to read all its certificates
    Given user1 buys 4 credit of type creation
    Given user1 creates a new certificate0 with uri "https://api.myjson.com/bins/cf4ph"
    Given user1 creates a new certificate1 with uri "https://api.myjson.com/bins/cf4ph"
    Given user1 creates a new certificate2 with uri "https://api.myjson.com/bins/cf4ph"
    Given user1 creates a new certificate3 with uri "https://api.myjson.com/bins/cf4ph"
    Then user1 can see its 4 certificates from getMyCertificates

  Scenario: User wants to read all its certificates groupby issue
    Given user2 is a brand
    Given user3 is a brand

    Given user4 with account from randomKey
    And user4 has a valid wallet
    And user4 claims faucet
    And user4 claims Aria

    Given user1 buys 2 credit of type creation
    And user1 creates a new certificate0 with uri "https://api.myjson.com/bins/cf4ph" and passphrase MyPassPhrase
    And user4 requests certificate0 with passprase MyPassPhrase

    And user4 claims faucet
    And user4 claims Aria

    Given user1 creates a new certificate1 with uri "https://api.myjson.com/bins/cf4ph" and passphrase MyPassPhrase
    And user4 requests certificate1 with passprase MyPassPhrase

    And user4 claims faucet
    And user4 claims Aria

    Given user2 buys 1 credit of type creation
    And user2 creates a new certificate2 with uri "https://api.myjson.com/bins/cf4ph" and passphrase MyPassPhrase
    And user4 requests certificate2 with passprase MyPassPhrase

    And user4 claims faucet
    And user4 claims Aria

    Given user3 buys 1 credit of type creation
    And user3 creates a new certificate2 with uri "https://api.myjson.com/bins/cf4ph" and passphrase MyPassPhrase
    And user4 requests certificate2 with passprase MyPassPhrase

    Then user4 can see its 4 certificates and 3 brands from groupByIssuerCertificates
