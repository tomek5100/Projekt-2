module.exports = (sequelize, DataTypes) => {
	
	const restauracje = sequelize.define("restauracje", {
		nazwa: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		zdjęcie: {
			type: DataTypes.STRING,
			allowNull: true,
		},
		opis: {
			type: DataTypes.TEXT,
			allowNull: true,
		},
		miasto: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		ulica: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		numer_lokalu: {
			type: DataTypes.STRING,
			allowNull: false,
		}
	},
	{
		tableName: 'restauracje',
		timestamps: false
	})
	
	restauracje.associate = (models) => {
		
	}
	
	return restauracje
}