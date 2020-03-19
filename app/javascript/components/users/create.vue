<template>
    <div class="ui segment">
        Create new user:

        <sui-form>
            <sui-form-field>
                <label>First Name</label>
                <input placeholder="First Name" />
            </sui-form-field>
            <sui-form-field>
                <label>Last Name</label>
                <input placeholder="Last Name" />
            </sui-form-field>
            <sui-form-field>
                <label>Last Name</label>
                <input v-model="email" placeholder="Last Name" />
            </sui-form-field>
            <sui-form-field>
                <sui-checkbox label="I agree to the Terms and Conditions" />
            </sui-form-field>
            <sui-button type="submit">Submit</sui-button>
        </sui-form>

        <pre>{{ email }}</pre>
    </div>
</template>

<script>
    export default {
        data () {
            return {
                someData: 'Just some data here!',
                email: ''
            }
        }
    }
</script>

<style lang="scss">
    /*@import '@node_modules/@braid/vue-formulate/themes/snow/snow.scss';*/
    /*@importx 'semantic-ui-css/semantic.min.css';*/

</style>
