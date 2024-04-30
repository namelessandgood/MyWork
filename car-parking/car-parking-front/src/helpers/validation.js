export const renderValidationErrors = (errors, field) => {
    return errors?.[field]?.length && errors[field].map((error, index) => {
        return <div className="alert alert-danger" key={index}>
            {error}
        </div>
    })
}