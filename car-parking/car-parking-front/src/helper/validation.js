export const readerValidationError = (error, field) => {
	return (
		error?.[field]?.length &&
		error[field].map((error, index) => {
			return (
				<div key={index} className="alert alert-danger">
					{error}
				</div>
			);
		})
	);
};
