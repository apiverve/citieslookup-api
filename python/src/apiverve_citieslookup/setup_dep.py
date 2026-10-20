from setuptools import setup, find_packages

setup(
    name='apiverve_citieslookup',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Cities Lookup is a city search API that searches over 150,000 global cities to find country codes, population counts, and city size classifications by name. Paid plans add GeoJSON coordinates and custom match limits.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/citieslookup?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
