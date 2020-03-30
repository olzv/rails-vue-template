<template>
    <div>
        <div class="ui header">
            Create new user
        </div>

        <div class="ui segment">
            <sui-form :loading="isLoading" :success="isSuccess" :error="isError" v-on:submit.prevent="onSubmit">
                <sui-form-field>
                    <label>First Name</label>
                    <input v-model="user.first_name" placeholder="First Name" />
                </sui-form-field>
                <sui-form-field>
                    <label>Last Name</label>
                    <input v-model="user.last_name" placeholder="Last Name" />
                </sui-form-field>
                <sui-form-field>
                    <label>Email</label>
                    <input v-model="user.email" placeholder="Last Name" />
                </sui-form-field>
                <sui-form-field>
                    <sui-checkbox label="I agree to the Terms and Conditions" />
                </sui-form-field>

                <sui-message success>
                    <sui-message-header>Form Completed</sui-message-header>
                    <p>
                        User created succesfully!
                    </p>
                </sui-message>

                <sui-message error>
                    <sui-message-header>Error</sui-message-header>
                    <p v-for="message in errorMessages">
                        {{message}}
                    </p>
                </sui-message>

                <sui-button type="submit">Submit</sui-button>
            </sui-form>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data () {
            return {
                user: {
                    first_name: null,
                    last_name: null,
                    email: null
                },
                isLoading: false,
                isSuccess: null,

                isError: false,
                errorMessages: []
            }
        },

        methods: {
            resetFormState() {
                this.isLoading = false
                this.isSuccess = null

                this.isError = false
                this.errorMessages = []
            },

            clearFormFields() {
                Object.keys(this.user)
                    .forEach(key => {
                        this.user[key] = null
                    })
            },

            onSubmit() {
                this.resetFormState()

                this.isLoading = true

                axios.post(
                    'api/v1/users',
                    this.user,
                    {
                        headers: {
                            'X-CSRF-TOKEN': this.getCsrfToken()
                        }
                    }
                )
                .then( response => {
                    this.isSuccess = true
                    this.clearFormFields()
                })
                .catch((error) => {
                    this.isError = true
                    if (!(this.errorMessages = error.response && error.response.data && error.response.data.errors)) {
                        throw error
                    }
                })
                .then(() => {
                    this.isLoading = false
                })


            },

            getCsrfToken() {
                return document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            }
        }
    }
</script>
