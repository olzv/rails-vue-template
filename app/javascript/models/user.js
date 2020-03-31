export default class User {
    #userRawData

    constructor(userRawData) {
        this.#userRawData = userRawData
    }

    get email() {
        return this.#userRawData.email
    }

    get firstName() {
        return this.#userRawData.first_name
    }

    get lastName() {
        return this.#userRawData.last_name
    }

    get fullName() {
        return [this.firstName, this.lastName].join(' ')
    }
}
