if ( Meteor.users.find().count() === 0 ) {
    Accounts.createUser({
        username: 'yyh',
        email: 'yhyuan@gmail.com',
        password: '1234567',
        profile: {
            first_name: 'fname',
            last_name: 'lname',
            company: 'company',
        }
    });
}